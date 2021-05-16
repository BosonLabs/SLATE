//campaign Factory contract
pragma solidity >=0.4;

contract campaignFactory{
    address[] public depolyedCampaigns;
    
    function createCampaign(uint minimum) public{
        address newCampaign = newCampaign(minimum,msg.sender);
        depolyedCampaigns.push("newCampaign");
    }
    
    function getDeployedCampaings() public view returns(address[]) {
        return depolyedCampaigns;
    }
}



  //campaigns contract

contract campaign{
    struct Request{
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
        mapping(address => bool)approvals;
        
    }
    
    Request[] public Requests;
    address public manager;
    uint public minimumContribution;
    mapping(address => bool)approvers;
    uint public approversCount;
    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
    
    function campaign(uint minimum, address creator) public {
        manager=creator;
        minimumContribution=minimum;
    }
    
    function contribute() public payable {
        require(ms.value>minimumContribution);
        approvers[msg.sender]=true;
        approversCount++;
    }
    
    function createRequest(string description,uint value,address recipient)public restricted{
        Request memory newRequest=Request({
            description:description,
            value:value,
            recipient:recipient,
            complete:false,
            approvalCount:0
        });
    request.push(newRequest);
    }
    
    function approveRequest(uint index)public {
        Request storage request = request[index];
        require(approvers[msg.sender]);
        require(!request.approvals[msg.sender]);
        request.approvals[msg.sender=true];
        request.approvalCount++;
    }
    
    function finalizeRequest(uint index) public restricted {
        Request storage request = requests[index];
        require(request.approvalCount > (approversCount/2));
        require(!request.complete);
        request.recipient.transfer(request.value);
        request.complete=true;
    }
}