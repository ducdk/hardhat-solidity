const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Greeter", function () {
  it("Should return the new greeting once it's changed", async function () {
    const Greeter = await ethers.getContractFactory("Greeter");
    const greeter = await Greeter.deploy("Hello, world!");
    await greeter.deployed();

    expect(await greeter.greet()).to.equal("Hello, world!");

    const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

    // wait until the transaction is mined
    await setGreetingTx.wait();

    expect(await greeter.greet()).to.equal("Hola, mundo!");
  });
});

describe("SolidityTest", function () {
  it("Should return the new SolidityTest once it's changed", async function () {
    const sol = await ethers.getContractFactory("SolidityTest");
    const solDep = await sol.deploy();
    await solDep.deployed();

    expect(await solDep.getLength()).to.equal(0);

    await solDep.push(1);
    
    expect(await solDep.getLength()).to.equal(1);
    
    await solDep.pop();
    
    expect(await solDep.getLength()).to.equal(0);
  });
});

describe("EnumTest", function () {
  it("Should return the new EnumTest once it's changed", async function () {
    const sol = await ethers.getContractFactory("Enum");
    const solDep = await sol.deploy();
    await solDep.deployed();

    await solDep.set(0);
    
    expect(await solDep.get()).to.equal(0);
  });
});

describe("TodoTest", function () {
  it("Should return the new Todos once it's changed", async function () {
    const sol = await ethers.getContractFactory("Todos");
    const solDep = await sol.deploy();
    await solDep.deployed();

    await solDep.create("new todo");
    let todo = await solDep.get(0);

    expect(todo.text).to.equal('new todo');
  });
});

describe("ErrorTest", function () {
  it("Should return the new Account once it's changed", async function () {
    const sol = await ethers.getContractFactory("Account");
    const solDep = await sol.deploy();
    await solDep.deployed();

    await solDep.deposit(1);
    await solDep.withdraw(1);
  });
  
});