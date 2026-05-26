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

## Usage Activity

Confirmed on 2026-05-26:

```text
set-monthly-limit tx:
0x3bca51f07c8888c2307b7c9ada1516b987f3a6f78f46aa22740f03b5f151ef38

record-spend tx:
0x21f27d92597693ddfe11b86802956744a7f2eef615e398319e203d2b9da5112c
```

## Boundary

The contract is a non-custodial developer proof. It records spend limits and receipts only. It does not transfer, approve, custody, swap, borrow, lend, or route funds.

## Next Action

Talent impact still shows zero after confirmed usage transactions. Ask Talent support / inspect the copied impact query with the deploy tx and two usage txs as evidence.

## Follow-Up

2026-05-26
