pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import 'igameobject.sol';
import 'gameobject.sol';
import 'warunit.sol';

contract Archer is WarUnit {

    uint a_health = health;

    function viewStats() public override returns(uint) {
        tvm.accept();
        return (a_health);
    }

    function actionRecieveAttack(uint value) public virtual override returns(uint) {
        tvm.accept();
        a_health = a_health - value;
        return a_health;
    }

    function actionRecieveArmor(uint value) virtual public override returns(uint) {
        tvm.accept();
        a_health = a_health + value;
        return a_health;
    }
}