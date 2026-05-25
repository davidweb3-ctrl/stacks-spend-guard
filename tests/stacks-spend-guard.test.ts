import { describe, expect, it } from "vitest";
import { standardPrincipalCV, stringAsciiCV, uintCV } from "@stacks/transactions";

const accounts = simnet.getAccounts();
const address1 = accounts.get("wallet_1")!;

describe("stacks-spend-guard", () => {
  it("lets a user set a monthly limit", () => {
    const { result } = simnet.callPublicFn(
      "stacks-spend-guard",
      "set-monthly-limit",
      [uintCV(202605), uintCV(2500)],
      address1,
    );

    expect(result).toBeOk(
      expect.objectContaining({
        type: "tuple",
      }),
    );
  });

  it("records spend receipts under the configured limit", () => {
    simnet.callPublicFn(
      "stacks-spend-guard",
      "set-monthly-limit",
      [uintCV(202605), uintCV(2500)],
      address1,
    );

    const { result } = simnet.callPublicFn(
      "stacks-spend-guard",
      "record-spend",
      [uintCV(202605), uintCV(499), stringAsciiCV("coffee")],
      address1,
    );

    expect(result).toBeOk(
      expect.objectContaining({
        type: "tuple",
      }),
    );

    const state = simnet.callReadOnlyFn(
      "stacks-spend-guard",
      "get-month-state",
      [standardPrincipalCV(address1), uintCV(202605)],
      address1,
    );

    expect(state.result).toBeTuple({
      spent: uintCV(499),
      "receipt-count": uintCV(1),
    });
  });

  it("rejects spend that exceeds the monthly limit", () => {
    simnet.callPublicFn(
      "stacks-spend-guard",
      "set-monthly-limit",
      [uintCV(202605), uintCV(2500)],
      address1,
    );

    const { result } = simnet.callPublicFn(
      "stacks-spend-guard",
      "record-spend",
      [uintCV(202605), uintCV(2501), stringAsciiCV("overspend")],
      address1,
    );

    expect(result).toBeErr(uintCV(103));
  });
});
