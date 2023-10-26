import 'package:construction/Admin/SiteManagement/Model/site_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SiteData initialization and property access', () {
    // Create an instance of SiteData
    final siteData = SiteData(
      projectId: '123',
      projectName: 'ProjectName',
      sitePlace: 'SitePlace',
      mainSupplier: 'MainSupplier',
      architect: 'Architect',
      natureProject: 'NatureProject',
      projectFigures: 'ProjectFigures',
      estimatedBudget: 'EstimatedBudget',
      remainingBudget: 'RemainingBudget',
      startDate: 'StartDate',
      endDate: 'EndDate',
      imageUrl: 'ImageUrl',
      newlyAllocated: 'NewlyAllocated',
      status: 'Status',
    );

    // Test property access
    expect(siteData.projectId, '123');
    expect(siteData.projectName, 'ProjectName');
    expect(siteData.sitePlace, 'SitePlace');
    expect(siteData.mainSupplier, 'MainSupplier');
    expect(siteData.architect, 'Architect');
    expect(siteData.natureProject, 'NatureProject');
    expect(siteData.projectFigures, 'ProjectFigures');
    expect(siteData.estimatedBudget, 'EstimatedBudget');
    expect(siteData.remainingBudget, 'RemainingBudget');
    expect(siteData.startDate, 'StartDate');
    expect(siteData.endDate, 'EndDate');
    expect(siteData.imageUrl, 'ImageUrl');
    expect(siteData.newlyAllocated, 'NewlyAllocated');
    expect(siteData.status, 'Status');
  });
}
