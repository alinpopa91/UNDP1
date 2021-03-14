import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'circle-component',
  templateUrl: './circle.component.html',
  styleUrls: ['./circle.component.scss'],
})
export class CircleComponent implements OnInit {
  @Input() Status: number;
  ImagePath: string;
  ImageName: string;
  ToolTipMessage: string;

  constructor() { }

  ngOnInit() {
    switch (this.Status) {
      case 0: {
        this.ImageName = "noaction";
        this.ToolTipMessage = "No Action Taken";
        break;
      }
      case 1: {
        this.ImageName = "approved";
        this.ToolTipMessage = "Approved";
        break;
      }
      case 2: {
        this.ImageName = "rejected";
        this.ToolTipMessage = "Not approved";
        break;
      }
      default: {
        this.ImageName = "noaction";
        break;
      }
    }
    this.ImagePath = "../../assets/images/" + this.ImageName + ".png";
  }

}
