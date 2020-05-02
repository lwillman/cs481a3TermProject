import PatientDataContract from "../contract_ABI/PatientData.json";
import store from "../redux/store";

//Code pulled from CryptoZombies and modified

export const BLOCKCHAIN_INITIALIZED = "BLOCKCHAIN_INITIALIZED"; // action type

// action creator (dispatch sends this to redux reducer)
function blockchainInitialized(data) {
    return {
        type: BLOCKCHAIN_INITIALIZED,
        payload: data
    };
}

//
//  set up the blockchain shadow contract, user address, and user zombie count.  Put into redux store.
//

async function initBlockchain(web3) {
    // Use web3 to get the user's accounts.
    const accounts = await web3.eth.getAccounts();
    const userAddress = accounts[0];

    // Get contract instance
    const instance = new web3.eth.Contract(
        PatientDataContract.abi, "0xd180300Cd7d80d724F343671f6B92092CdF20777"
    );

    // put state data into the REDUX store for easy access from other pages and components

    let data = {
        CZ: instance,
        userAddress    // shorthand
    };

    store.dispatch(blockchainInitialized(data));
    return data;
}

export default initBlockchain;
