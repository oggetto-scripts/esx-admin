interface Job {
  name: string;
  grade: number;
}

interface Ped {
  model: number;
  coords: {
    x: number;
    y: number;
    z: number;
  };
  health: number;
  armor: number;
}

export interface Player {
  id: number;
  name: string;
  username: string;
  identifier: string;
  job: Job;
  group: string;
  money: number;
  bank: number;
  black_money: number;
  ped: Ped;
}
