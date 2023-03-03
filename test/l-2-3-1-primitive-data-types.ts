import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("l-2-3-1-primitive-data-types", function () {

  async function deploy() {
    const contractFactory = await ethers.getContractFactory("PrimitiveDataTypes");
    const contract = await contractFactory.deploy();

    return { contract };
  }

  describe("Deployment", function () {
    it("Update purpose", async function () {
      const { contract } = await loadFixture(deploy);

      await contract.setPurpose('New purpose');

      const purpose = await contract.purpose();

      expect(purpose).to.equal("New purpose");
    });

    it("Update is valid", async function () {
      const { contract } = await loadFixture(deploy);

      await contract.setValid(true);

      const isValid = await contract.isValid();

      expect(isValid).to.equal(true);
    });
  });
});
