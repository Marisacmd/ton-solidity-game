pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'igameobject.sol';

contract GameObject is IGameObject {

    uint health = 5;

    address callerAddress;

    address dest = address(this);
    uint128 val = 1;
    bool bounceData = false;

    modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        _;
    }

    function actionRecieveAttack(uint value) public virtual override returns(uint) {
        tvm.accept();
        if (msg.isExternal) {
            callerAddress = msg.sender;
        } else {
            callerAddress = callerAddress;
        }
        health = health - value;
        return health;
    }

    function actionRecieveArmor(uint value) virtual public returns(uint) {
        tvm.accept();
        health = health + value;
        return health;
    }

    function actionAttack(IGameObject enemyAddress, uint128 amount) public {
        tvm.accept();
        enemyAddress.actionRecieveAttack(amount);
    }

    function checkObjectStatus() virtual public returns(bool) {
        tvm.accept();
        if (health > 0) {
            return true;
        } else {
            return false;
        }
    }

    function selfDestroy() public virtual checkOwnerAndAccept {
        dest.transfer(val, bounceData, 160);
    }

}