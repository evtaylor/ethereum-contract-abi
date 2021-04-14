# ethereum-contract-abi

A library for interacting with Ethereum smart contracts via the Contract Application Binary Interface (ABI).

For more info see: https://docs.soliditylang.org/en/latest/abi-spec.html

Can encode function calls with types:
- ✅ `address`
- ✅ `bool`
- ✅ `bytes`
- ✅ `fixed`
- ✅ `int`
- ✅ `uint`
- ✅ `string`
- ❌ `<type>[]`
- ❌ `tuple`

Can decode function calls with types:
- ❌ `address`
- ❌ `bool`
- ❌ `bytes`
- ❌ `fixed`
- ✅ `int`
- ✅ `uint`
- ✅ `string`
- ❌ `<type>[]`
- ❌ `tuple`