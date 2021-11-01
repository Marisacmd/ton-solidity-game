pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'igameobject.sol';
import 'gameobject.sol';

contract WarUnit is GameObject {

    uint wu_health = health;

    function viewStats() public virtual returns(uint) {
        tvm.accept();
        return wu_health;
    }

    function actionRecieveAttack(uint value) public virtual override returns(uint) {
        tvm.accept();
        wu_health = wu_health - value;
        return wu_health;
    }

    function actionRecieveArmor(uint value) virtual public override returns(uint) {
        tvm.accept();
        wu_health = wu_health + value;
        return wu_health;
    }

    function selfDestroy() public override checkOwnerAndAccept {
        dest.transfer(val, bounceData, 160);
    }

}