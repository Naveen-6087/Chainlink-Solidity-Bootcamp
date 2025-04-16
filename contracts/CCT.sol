// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IBurnMintERC20} from "@chainlink/contracts-ccip/src/v0.8/shared/token/ERC20/IBurnMintERC20.sol";
import {
    ERC20,
    ERC20Burnable
} from
    "@chainlink/contracts-ccip/src/v0.8/vendor/openzeppelin-solidity/v4.8.3/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {AccessControl} from
    "@chainlink/contracts-ccip/src/v0.8/vendor/openzeppelin-solidity/v4.8.3/contracts/access/AccessControl.sol";

contract MyToken is IBurnMintERC20, ERC20Burnable, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    address internal s_CCIPAdmin;

    event CCIPAdminSet(address indexed ccipAdmin);

    constructor() ERC20("MyToken", "MTK") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(BURNER_ROLE, msg.sender);
        s_CCIPAdmin = msg.sender;
    }

    function grantMintAndBurnRoles(address burnAndMinter) external {
        grantRole(MINTER_ROLE, burnAndMinter);
        grantRole(BURNER_ROLE, burnAndMinter);
    }

    function mint(address account, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(account, amount);
    }

    function burn(uint256 amount) public override(IBurnMintERC20, ERC20Burnable) onlyRole(BURNER_ROLE) {
        super.burn(amount);
    }

    function burnFrom(address account, uint256 amount)
        public
        override(IBurnMintERC20, ERC20Burnable)
        onlyRole(BURNER_ROLE)
    {
        super.burnFrom(account, amount);
    }

    function burn(address account, uint256 amount) public virtual override {
        burnFrom(account, amount);
    }

    function getCCIPAdmin() external view returns (address) {
        return s_CCIPAdmin;
    }

    function setCCIPAdmin(address ccipAdmin) external onlyRole(DEFAULT_ADMIN_ROLE) {
        s_CCIPAdmin = ccipAdmin;

        emit CCIPAdminSet(ccipAdmin);
    }
}