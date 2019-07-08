'use strict';

const e = React.createElement;

class AppRoot extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            error: null,
            isLoaded: false,
            items: [],
            version: window.VERSION,
            backend_version: "unknown",
            backend_host: window.BACKEND_HOST
        };
    }

    componentDidMount() {
        fetch(this.state.backend_host + "/api/team")
            .then(res => res.json())
            .then(
                (result) => {
                    this.setState({
                        isLoaded: true,
                        teamNames: result
                    });
                },
                (error) => {
                    console.error("Error loading teams")
                    console.error(error)
                    this.setState({
                        isLoaded: true,
                        error: "Could not load teams"
                    });
                }
            )

        fetch(this.state.backend_host + "/api/version")
            .then(res => res.json())
            .then(
                (result) => {
                    this.setState({ backend_version: result.major + "." + result.minor + "." + result.build + "." + result.revision });
                },
                (error) => {
                    console.error("Error loading backend version")
                    console.error(error)
                }
            )

    }

    selectTeam(teamName) {
        if (this.state.teamNames !== undefined) {
            fetch(this.state.backend_host + "/api/team/" + teamName)
                .then(res => res.json())
                .then(
                    (result) => {
                        this.setState({
                            selectedTeam: result
                        });
                    },
                    (error) => {
                        console.error("Error loading team members")
                        console.error(error)
                        this.setState({ error: "Could not load team members" });
                    }
                )
        }
    }

    isTeamSelected(teamName) {
        if (this.state.selectedTeam === undefined) {
            return false;
        }

        return this.state.selectedTeam.teamName === teamName;
    }

    render() {

        let that = this;
        let teamSelection;
        if (!this.state.isLoaded) {
            teamSelection = (<span className="badge badge-info">Loading ...</span>)
        } else if (this.state.isLoaded && this.state.error != undefined) {
            teamSelection = (
                <div>
                    <span className="badge badge-danger">Error:</span>
                    <div>{ this.state.error }</div>
                </div>
            )
        } else {
            teamSelection = (
                <div>
                    <small>Please select a team ...</small>

                    {
                        this.state.teamNames.map(function (teamName, i) {
                            let selectedClass = "";
                            if (that.isTeamSelected(teamName)) {
                                selectedClass = " selected"
                            }
                            return <div key={ i } className={ "box" + selectedClass } onClick={ () => that.selectTeam(teamName) }><a href="#">{ teamName }</a> <i className='fas fa-angle-right'></i></div>
                        })
                    }
                </div>
            )
        }

        let teamMembers

        if (this.state.selectedTeam !== undefined) {
            teamMembers = (
                <div>
                    <h3>Team Members</h3>
                    { this.state.selectedTeam.members.map(function (member, i) {
                        return (
                            <div className="box" key={ i }>
                                Name: { member.name }<br />
                                Role: { member.role }
                            </div>)
                    }) }
                </div>
            )
        } else if (this.state.selectedTeam === undefined && this.state.error === undefined) {
            teamMembers = (<div>Please select a team</div>)
        } else {
            teamMembers = (<div></div>)
        }

        return (
            <div>
                <h1>Azure Kubernetes Workshop</h1>
                <h2>Demo Application <span className="badge badge-secondary">{ this.state.version }</span></h2>

                <hr />

                <div id="configurable">
                    <p><i className="fas fa-info-circle"></i> The color can be configured via environment variable: <strong>COLOR</strong></p>
                </div>
                <div className="content">
                    <small><i className="fas fa-info-circle"></i> Here some ajax request will be performed</small><br />
                    <a href={ this.state.backend_host + "/health/ready" } target="_blank">Backend: { this.state.backend_host } <span className="badge badge-secondary">{ this.state.backend_version }</span></a>
                    <div>
                        <h3>Teams</h3>
                        { teamSelection }
                    </div>
                    <div>
                        { teamMembers }
                    </div>
                </div>
            </div>
        );
    }
}

const domContainer = document.querySelector('#app');
ReactDOM.render(e(AppRoot), domContainer);