const ApprovalContract = artifacts.require('../../contracts/ApprovalContract.sol');

contract('ApprovalContract', function (accounts) {
    it('initiates contract', async function() {
        const contract = await ApprovalContract.deployed();
        const approver = await contract.approver.call();
        assert.equal(approver, 0xAa8A9823D2b9CFB3AD0E2209Ed5A02E0afFA4c54, "approvers don't match") 
    });

    it('takes a deposit', async function() {
        const contract = await ApprovalContract.deployed();
        await contract.deposit(accounts[0], {value: 1e+18, from: accounts[2]});
        let balance = await web3.eth.getBalance(contract.address);
        assert.equal(balance, 1e+18, "amount did not match");
    })


})