import React, { Component } from 'react';
import { connect } from 'react-redux';
import GoogleMapReact from 'google-map-react';
import getRecords from "../utils/getRecords";
import getWeb3 from "../utils/getWeb3";
import initBlockchain from "../utils/initBlockchain";

function mapStateToProps(state) {
    return {
        parsedRecords: state.parsedRecords
    };
}

class HeatMap extends Component {
    state = {parsedRecords: this.props.parsedRecords};

    testHeatMapData = {
        positions: [{lat: 0, lng: 0, weight: 1}, {lat: 10, lng: 0, weight: 10}],
        options: {
            radius: 20,
            opacity: 0.6
        }
    }

    static defaultProps = {
        center: {
            lat: 0,
            lng: 0
        },
        zoom: 0
    };
    render() {
        console.log(this.props.parsedRecords);
        return (
            // Important! Always set the container height explicitly
            <div style={{height: '100vh', width: '100%'}}>
                <style>{'body { background-color: #282c34'}</style>
                <GoogleMapReact
                    bootstrapURLKeys={{key: "AIzaSyCBaDqMrfsaVp1bpLFa45qb64liF4XyS3c"}}
                    defaultCenter={this.props.center}
                    defaultZoom={this.props.zoom}
                    heatmapLibrary={true}
                    heatmap={this.props.parsedRecords}
                >
                </GoogleMapReact>
            </div>
        );
    }
}

export default connect(mapStateToProps)(HeatMap);