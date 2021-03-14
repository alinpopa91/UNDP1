import { Component, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent {
  public teamList: TeamList[];
  public teamStatus: number;
  public teamId: number;
  public _http: HttpClient;
  public endPoint: string;

  constructor(http: HttpClient, @Inject('BASE_URL') baseUrl: string) {
    http.get<TeamList[]>(baseUrl + 'api/Team').subscribe(result => {
      this.teamList = result;
    }, error => console.error(error));

    this._http = http;
    this.endPoint = baseUrl;
  }

  ManagerChangeState(currentValue, team) {

    if (currentValue == 2) {
      this.teamStatus = 0;
    }
    else {
      this.teamStatus = currentValue + 1;
    }


    this.teamId = team;

    this._http.get(this.endPoint + `api/Team/ManagerDecision/` + this.teamId + `/` + this.teamStatus).subscribe(
      res => alert('Team Status Saved'),
      err => alert('Error'),
      () => console.log('HTTP request completed.'));
  }

  DirectorChangeState(currentValue, team) {

    if (currentValue == 2) {
      this.teamStatus = 0;
    }
    else {
      this.teamStatus = currentValue + 1;
    }


    this.teamId = team;

    this._http.get(this.endPoint + `api/Team/DirectorDecision/` + this.teamId + `/` + this.teamStatus).subscribe(
      res => alert('Team Status Saved'),
      err => alert('Error'),
      () => console.log('HTTP request completed.'));
  }


}
