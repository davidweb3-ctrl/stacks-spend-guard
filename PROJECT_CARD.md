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

## Mainnet Deployment

Deployed on 2026-05-26:

```text
deployments/default.mainnet-plan.yaml
contract: SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4.stacks-spend-guard
tx: 0x8f4441f725aac7337eb6cf1b80eb8013637430530adecce337e63a7403d9d980
final cost: 28230 micro-STX = 0.02823 STX
```

Clarinet initially generated a higher plan cost, then recomputed and overwrote the plan with the lower final cost during apply.

## Talent Data Source

Added on 2026-05-26:

```text
chain: Stacks
contract: SPMFETRXF1CG8YMBX29M2RT1HNRS7JYWFDN31XZ4.stacks-spend-guard
result: Deployer wallet verified. Smart contract has been added to this project.
```

## Boundary

The contract is a non-custodial developer proof. It records spend limits and receipts only. It does not transfer, approve, custody, swap, borrow, lend, or route funds.

## Next Action

Use the Stacks Builder Rewards page `Add Project` button to attach the existing `Stacks Spend Guard` project to the campaign, then confirm leaderboard / participation inclusion.

## Follow-Up

2026-05-26
