type Ammo = {
  name: string;
  id: string;
  category: string;
};

export const ammos: Ammo[] = [
  { name: '9mm Ammo', id: 'ammo-9', category: 'handgun' },
  { name: '.22 Ammo', id: 'ammo-22', category: 'handgun' },
  { name: '.38 Ammo', id: 'ammo-38', category: 'handgun' },
  { name: '.44 Ammo', id: 'ammo-44', category: 'handgun' },
  { name: '.45 Ammo', id: 'ammo-45', category: 'handgun' },
  { name: '.50 Ammo', id: 'ammo-50', category: 'handgun' },
  { name: 'Rifle Ammo', id: 'ammo-rifle', category: 'rifle' },
  { name: 'Rifle Ammo 2', id: 'ammo-rifle2', category: 'rifle' },
  { name: 'Shotgun Ammo', id: 'ammo-shotgun', category: 'shotgun' },
  { name: 'EMP Ammo', id: 'ammo-emp', category: 'special' },
  { name: 'Flare Ammo', id: 'ammo-flare', category: 'special' },
  { name: 'Sniper Ammo', id: 'ammo-sniper', category: 'sniper' },
  { name: 'Heavy Sniper Ammo', id: 'ammo-heavysniper', category: 'sniper' },
  { name: 'Musket Ammo', id: 'ammo-musket', category: 'special' }
];