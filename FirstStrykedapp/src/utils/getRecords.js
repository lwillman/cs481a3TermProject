import store from "../redux/store";

const RECORDS = "RECORDS"; // action type

// action creator (dispatch sends this to redux reducer)
function records(data) {
    return {
        type: RECORDS,
        payload: data
    };
}

async function getRecords(FS) {

    let recordData = (await FS.methods.getRecords().call());
    let parsedRecords = {
        positions: [],
        options: {
            radius: 20,
            opacity: 0.7
        }
    }

    for(let i = 1; i < recordData.length; i++){
        let [lat, lng] = recordData[i].latLon.split(',');
        let count = parseFloat(recordData[i].count);
        lat = parseFloat(lat);
        lng = parseFloat(lng);
        if(!(isNaN(lat) || isNaN(lng) || isNaN(count)))
            parsedRecords.positions.push({lat: lat, lng: lng, weight: count});
    }
    // put state data into the REDUX store for easy access from other pages and components

    let data = {
        parsedRecords
    };

    store.dispatch(records(data));
    return parsedRecords;
}

export default getRecords;