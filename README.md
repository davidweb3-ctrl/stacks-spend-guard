# Stacks Spend Guard

Stacks Spend Guard is a small Bitcoin L2 payment-safety proof for Stacks Builder Rewards.

The Clarity contract lets each user:

- set a monthly spend limit;
- record merchant spend receipts;
- read monthly spent amount, receipt count, and remaining limit.

It is intentionally non-custodial. It does not transfer, approve, custody, borrow, lend, swap, or route funds.

## Contract

```text
contracts/stacks-spend-guard.clar
```

## Local Checks

```bash
clarinet check
npm test
```

Current local result:

```text
clarinet check: 1 contract checked
npm test: 3 tests passed
```

## Deployment

See `DEPLOYMENT_NOTES.md`.

## Talent Contract Format

Talent expects a Stacks contract principal after deployment:

```text
SP...address.stacks-spend-guard
```

Do not use this repo as a production wallet or custody system.
