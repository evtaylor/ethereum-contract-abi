# ethereum-contract-abi

Warning: This library is in development, is not ready for production, and may be unstable

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

## Usage

### Encoding function calls

`contract_abi.json`
```json
[{
  "inputs": [
    {
      "internalType": "uint256",
      "name": "tokenId",
      "type": "uint256"
    }
  ],
  "name": "tokenURI",
  "outputs": [
    {
      "internalType": "string",
      "name": "",
      "type": "string"
    }
  ],
  "stateMutability": "view",
  "type": "function"
}]
```

```ruby
contract_json = File.read("contract_abi.json")
contract = ContractParser.from_json(contract_json)
result = contract.tokenURI.encode_call(1000036541)
p result # "0xc87b56dd000000000000000000000000000000000000000000000000000000003b9b58bd"
```

### Decoding function calls

```ruby
contract_json = File.read('contract_abi.json')
contract = ContractParser.from_json(contract_json)

function_output = "0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002c68747470733a2f2f6d6574612e706f6c6b616d6f6e2e636f6d2f6d6574613f69643d313030303033363534310000000000000000000000000000000000000000"
result = contract.tokenURI.decode_output(function_output)
p result # ["https://meta.polkamon.com/meta?id=1000036541"]
```