interface Job {
    name: string;
    grade: number;
}

export interface Player {
    id: number;
    name: string;
    job: Job;
    group: string;
    money: number;
    bank: number;
    black_money: number;
}