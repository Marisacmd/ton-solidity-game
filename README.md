# ⚔️ ton-solidity-game

A simple game which consists of solidity smart contracts demonstrates the possibility to include inheritance/interface logic within user interactive applications 

# deploy

Deploy and run contracts:

```
tondev sol compile <Contract.sol>
tondev c d <Contract.sol> -v 9999999
tondev c r <Contract>
```

# ⚔️ start a game

Test game units interaction

1. Compile and deploy "friendly" archer:
```
tondev sol compile archer.sol
tondev c d archer.sol -v 99999999
```

2. Compile and deploy "enemy" archer:
```
tondev sol compile enemyarcher.sol
tondev c d enemyarcher.sol
tondev c r enemyarcher.sol //Copy address of contract, and check health (viewstats)
```

//code of these two "archers" is all the same except one (meaningless) string in "enemyarcher" in order to make compiler think that it is not already deployed contract.

3. Run our "friendly" archer:
tondev c r archer.sol
```
- select "attack" function
- paste address of previously obtained Enemyarcher contract

```
