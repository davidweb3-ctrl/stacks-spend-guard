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

## Deployment Path

Preferred:

1. Create or use a low-balance Leather or Xverse wallet.
2. Fund only the approved small STX amount.
3. Deploy `contracts/stacks-spend-guard.clar` as contract name:

```text
stacks-spend-guard
```

4. After deployment, add the contract principal to Talent:

```text
SP...address.stacks-spend-guard
```

## References

- Stacks contract deployment docs: https://docs.stacks.co/learn-clarinet/contract-deployment
- Stacks network fee docs: https://docs.stacks.co/concepts/network-fundamentals/network
- Hiro API fee endpoint docs: https://hirosystems.github.io/stacks-blockchain-api/
