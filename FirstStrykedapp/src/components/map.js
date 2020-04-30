import React, { Component } from 'react';
import GoogleMapReact from 'google-map-react';

class HeatMap extends Component {
    heatMapData = {
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
        return (
            // Important! Always set the container height explicitly
            <div style={{ height: '100vh', width: '100%' }}>
                <GoogleMapReact
                    bootstrapURLKeys={{ key: "" }}
                    defaultCenter={this.props.center}
                    defaultZoom={this.props.zoom}
                    heatmapLibrary={true}
                    heatmap={this.heatMapData}
                >
                </GoogleMapReact>
            </div>
        );
    }
}

export default HeatMap;