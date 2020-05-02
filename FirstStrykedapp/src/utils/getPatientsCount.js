import store from "../redux/store";

export const Patient_COUNT = "Patient_COUNT"; // action type

// action creator (dispatch sends this to redux reducer)
function patientCount(data) {
  return {
    type: Patient_COUNT,
    payload: data
  };
}

//
//  set up the blockchain shadow contract, user address, and user zombie count.  Put into redux store.
//

async function getPatientCount(FS, virus) {
  // get number of Patient owned by the user account

  let userPatientCount = +(await FS.methods // + convert a string to an integer
    .totalPatientsPerVirus(virus)
    //virus name
    .call());

  // do a binary search to estimate total zombie count.
  // It is a real shame that the Cryptozombies contract doesn't totally comply with ERC720 to include a function
  // that returns totalZombieount.

  var high = 8192;
  var low = 0;
  var middle = 4096;

  while (low < high) {
    try {
      await FS.methods.Patient(middle).call();
      low = middle + 1;
      middle = Math.floor(low + (high - low) / 2);
    } catch {
      high = middle - 1;
      middle = Math.floor(low + (high - low) / 2);
    }
  }

  // put state data into the REDUX store for easy access from other pages and components

  let data = {
    totalPatientCount: low-1,     // from binary search
    userPatientCount      //EC7 shorthand for totalPatientCount:totalPatientCount because of same variable name
  };

  store.dispatch(patientCount(data));
}

export default getPatientCount;
