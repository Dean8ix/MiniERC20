import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


const MiniERC20Module = buildModule("MiniERC20Module", (m) => {

  const miniERC20 = m.contract("MiniERC20");

  return { miniERC20 };
});

export default MiniERC20Module;
