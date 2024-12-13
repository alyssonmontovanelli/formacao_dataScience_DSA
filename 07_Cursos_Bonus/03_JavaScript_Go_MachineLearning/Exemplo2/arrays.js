
/* 

Estruturas de Dados - Arrays

*/
var linguagens = ['JavaScript', 'Python', 'Scala'];

console.log("Trabalhando com Arrays:");
console.log(linguagens);
console.log(typeof(linguagens));
console.log(linguagens.length); //tamanho do array
console.log(linguagens.indexOf('Python')); //Indice do elemento
console.log(linguagens[0]);

linguagens[2] = 'Java';
linguagens[3] = 'Go';

console.log(linguagens[2]);
console.log(linguagens[3]);
console.log(linguagens);

var valores = new Array(250, 'Londres', ['PHP', true]);

console.log(valores);

