
interface TeamList {
  Id: number;
  TeamName: string;
  TeamDescription: string;
  ApprovedByManager: number;
  ApprovedByDirector: number;
  TeamMembers: TeamMembers[];
}

interface TeamMembers {
  ID: number;
  TeamId: number;
  Name: string;
  Gender: string;
  DateOfBirth: Date;
  ContactNo: number;
}
