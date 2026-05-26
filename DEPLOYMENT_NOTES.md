# Deployment Notes

Date: 2026-05-25

## Current State

Local checks:

```bash
clarinet check
npm test
```

Results:

```text
clarinet check: 1 contract checked
npm test: 3 tests passed
```

## Talent Format

Talent expects a Stacks contract principal:

```text
SP...address.stacks-spend-guard
```

## Mainnet Cost Boundary

Do not deploy until the user explicitly approves funding a Stacks wallet.

Observed on 2026-05-25:

```text
curl https://api.mainnet.hiro.so/v2/fees/transfer
4
```

Stacks docs define fees as fee-rate times serialized transaction byte size, and `1 STX = 1,000,000 micro-STX`. The source contract is about 2.8 KB, so a simple contract deploy should be low-cost in STX terms, but wallet UIs may recommend a larger safety buffer.

Practical funding recommendation before deployment:

```text
0.05 STX maximum initial funding budget
```

Expected actual transaction fee should likely be much lower than that, but this buffer avoids failed deployment attempts if the wallet suggests a higher fee.

## Mainnet Plan Generated

Generated on 2026-05-26:

```bash
clarinet deployments generate --mainnet --low-cost
```

Generated file:

```text
deployments/default.mainnet-plan.yaml
```

Initial plan summary:

```text
transaction-type: contract-publish
contract-name: stacks-spend-guard
expected-sender: SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4
cost: 921103 micro-STX = 0.921103 STX
clarity-version: 4
```

The first generated cost exceeded the original `0.05 STX` deployment budget, so it was treated as an approval gate.

When applying the deployment, Clarinet recomputed and overwrote the plan with a lower cost:

```text
cost: 28230 micro-STX = 0.02823 STX
```

Mainnet deployment succeeded:

```text
contract: SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4.stacks-spend-guard
tx: 0x8f4441f725aac7337eb6cf1b80eb8013637430530adecce337e63a7403d9d980
block: 8089390
result: (ok true)
```

## Deployment Path

Preferred:

1. Create or use a low-balance Leather or Xverse wallet.
2. Fund only the approved STX amount.
3. Generate the mainnet deployment plan and inspect the fee.
4. Deploy `contracts/stacks-spend-guard.clar` as contract name only after approving the fee:

```text
stacks-spend-guard
```

5. After deployment, add the contract principal to Talent:

```text
SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4.stacks-spend-guard
```

## References

- Stacks contract deployment docs: https://docs.stacks.co/learn-clarinet/contract-deployment
- Stacks network fee docs: https://docs.stacks.co/concepts/network-fundamentals/network
- Hiro API fee endpoint docs: https://hirosystems.github.io/stacks-blockchain-api/
