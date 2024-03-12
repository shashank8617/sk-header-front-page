console.log(window);
console.log(document);
console.log(docutnment.head);
console.log(docutnment.title);
console.log(docutnment.URL);

console.log((docutnment.title="changed"));

//dom methods
//1.get elelmentsbyID
// it return an object which element having an same id as well as value as an docutnment object


let elementId=dicutnment.getElementById("demo");
console.log(elementId,typeof elementId);

//innerHTML(proiperty of dom)
//elementId.innerHTML="<h1>i want to change</h1>";

//innertext(property of dom)
//elementId.innerText="<h1>i too want to change</h1>";
elementId.innerText="web technology";
elementId.style.color="red";
elementId.style.fontSize="50px";

let elelmentsbyID1=docutnment.getElementById("test");
console.log(elelmentsbyID1,typeof elelmentsbyID1);




let table=document.createElement('table');
console.log(table);
//table.id="demo";
//table.innerText="worst";

table.style.border="1px solid red";

tr1=document.createElement('tr');
console.log(tr1);
td1=document.createElement('td');
td1.style.border="1px solid red";
td2=document.createElement('td');
td2.style.border="1px solid red";
console.log(td1,td2);


tr1.append(td1,td2);
table.appendChild(tr1)
document.body.appendChild(table)

td1.innerText="Id";
td2.innerText="Name";

tr2=document.createElement('tr');
console.log(tr2)
td11=document.createElement('td');
td11.innerText="100";

tr11=document.createElement('tr');
console.log(tr11);
td11=document.createElement('td');
td11.style.border="1px solid red";
td12=document.createElement('td');
td12.style.border="1px solid red";
console.log(td11,td12);