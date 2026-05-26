# PROJECT_CARD

Project ID:

```text
P-20260525-stacks-spend-guard
```

Command Center:

```text
/Users/xiadawei/codeSpace/web3/web3-execution-lab
```

Project:

```text
Stacks Spend Guard
```

Status:

```text
ACTIVE
```

## Purpose

Minimal Clarity contract for the Talent / Stacks Builder Rewards preflight.

## Current Artifact

```text
contracts/stacks-spend-guard.clar
```

## Verification

2026-05-25:

```text
clarinet check
✔ 1 contract checked

npm test
3 tests passed
```

## Deployment Notes

```text
DEPLOYMENT_NOTES.md
```

## Mainnet Plan

Generated on 2026-05-26:

```text
deployments/default.mainnet-plan.yaml
contract: SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4.stacks-spend-guard
cost: 921103 micro-STX = 0.921103 STX
```

This is above the original `0.05 STX` deployment budget and requires explicit user approval before applying the mainnet deployment.

## Boundary

The contract is a non-custodial developer proof. It records spend limits and receipts only. It does not transfer, approve, custody, swap, borrow, lend, or route funds.

## Next Action

Approve or reject the `0.921103 STX` mainnet deployment cost. If approved, run `clarinet deployments apply --mainnet`, then add `SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4.stacks-spend-guard` to Talent.

## Follow-Up

2026-05-26
