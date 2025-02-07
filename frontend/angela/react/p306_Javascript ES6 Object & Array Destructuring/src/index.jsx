import animals, { useAnimal } from './data.js';

//Destructuring Arrays
// console.log(animals);
const [cat, dog] = animals;
// console.log(cat);

const [animal, makeSound] = useAnimals(cat);
console.log(animal);
makeSound();

//Destructuring Objects
// const { name, sound} = cat;
const { name: catName, sound: catSound } = cat;
const { name = 'Fluffy', sound = 'Purr' } = cat;
const {
  feedingRequirements: { food, water },
} = cat;
console.log(food);

// const [cat, dog] = animals;

// const [animal, setAnimal] = useAnimal(cat);

// console.log(animal);
// console.log(setAnimal());
// console.log(useAnimal(cat));
