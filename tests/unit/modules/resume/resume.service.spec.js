// require('src/modules/resume/resume.service.coffee');
var expect = chai.expect;

describe('resume.service', function () {
  var service;
  beforeEach(require('../../../../src/modules/resume/resume.service.coffee'));
  beforeEach(module('tthew.resume.service'));
  beforeEach(inject(function (_resumeService_) {
    service = _resumeService_;
  }));
  it('service.getExperience() should be defined', function () {
    expect(service.getExperience).to.be.defined;
  });
});
