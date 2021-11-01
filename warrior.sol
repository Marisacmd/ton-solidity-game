pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'igameobject.sol';
import 'gameobject.sol';
import 'warunit.sol';

contract Warrior is WarUnit {

    uint w_health = health;

    function viewStats() public override returns(uint) {
        tvm.accept();
        return (w_health);
    }

    function actionRecieveAttack(uint value) public virtual override returns(uint) {
        tvm.accept();
        w_health = w_health - value;
        return w_health;
    }

    function actionRecieveArmor(uint value) virtual public override returns(uint) {
        tvm.accept();
        w_health = w_health + value;
        return w_health;
    }
}