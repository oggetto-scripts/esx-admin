interface Job {
    name: string;
    grade: number;
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
}