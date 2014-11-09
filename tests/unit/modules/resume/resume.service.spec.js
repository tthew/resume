var Controller = require('modules/resume/resume.controller.coffee');
var expect = chai.expect;

describe('resume.service', function () {
  // before(function () {
  //   angular.module('resume.controller.coffee', [])
  //     .controller('Controller', controller);
  // });
  // beforeEach(module('resume.controller.coffee'));

  describe('Public API', function () {
    var controller, experienceMock = {}, skillsMock = {}, coverLetterMock = {}, educationMock = {};
    beforeEach(function () {
      controller = new Controller(experienceMock, skillsMock, coverLetterMock, educationMock);
    });

    it('experience should be defined and equal to constructor param', function () {
      expect(controller.experience).to.eq(experienceMock);
    });

    it('skills should be defined and equal to constructor param', function () {
      expect(controller.skills).to.eq(skillsMock);
    });

    it('education should be defined and equal to constructor param', function () {
      expect(controller.education).to.eq(educationMock);
    });

    it('coverLetter should be defined and equal to constructor param', function () {
      expect(controller.coverLetter).to.eq(coverLetterMock);
    });
  });
});
