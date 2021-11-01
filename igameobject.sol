pragma ton-solidity >= 0.5.0;
pragma AbiHeader expire;

interface IGameObject {
	function actionRecieveAttack(uint value) external returns (uint);
}
