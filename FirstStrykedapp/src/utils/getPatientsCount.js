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

  let totalPatientCount = (await FS.methods.totalPatientsPerVirus(virus)
    //virus name
    .call());

  // put state data into the REDUX store for easy access from other pages and components

  let data = {
    totalPatientCount      //EC7 shorthand for totalPatientCount:totalPatientCount because of same variable name
  };

  store.dispatch(patientCount(data));
}

export default getPatientCount;
