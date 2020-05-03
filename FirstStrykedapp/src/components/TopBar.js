import React from 'react';
import { BrowserRouter, Route, Switch, NavLink } from 'react-router-dom';
import HeatMap from "./map";
//import Dashboard from './pages/Dashboard';
import Home from './home';
import AboutUs from './DataEntry';

class NavigationBar extends React.Component {
    render() {
        return (
            <BrowserRouter>
                <div>
                    <div>
                        <nav className="navbar navbar-expand-md bg-dark navbar-dark">
                            <div className="container-fluid">
                                <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                                    <span className="navbar-toggler-icon"/>
                                </button>
                                <div className="collapse navbar-collapse" id="collapsibleNavbar">
                                    <ul className="nav navbar-nav">
                                        <NavLink className="nav-link" exact to="/" >Home</NavLink>
                                        <NavLink className="nav-link" exact to="/Map" >Map</NavLink>
                                        <NavLink className="nav-link" exact to="/data_entry" >Data Entry</NavLink>

                                    </ul>
                                </div>
                            </div>
                        </nav>
                        <div className="content">
                            <Switch>
                                <Route path="/" component={Home} exact />
                                <Route path="/map" component={HeatMap} exact />
                                <Route path="/data_entry" component={AboutUs} exact />
                            </Switch>
                        </div>
                    </div>
                </div>
            </BrowserRouter>
        );
    }
}
export default NavigationBar;