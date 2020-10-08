import 'package:kb_mobile_app/core/offline_db/enrollment_offline/enrollment_offline_provider.dart';
import 'package:kb_mobile_app/core/offline_db/tracked_entity_instance_offline/tracked_entity_instance_offline_provider.dart';
import 'package:kb_mobile_app/core/services/organisation_unit_service.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/agyw_dream.dart';
import 'package:kb_mobile_app/models/enrollment.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/models/non_agyw_enrollment_client_intake.dart';
import 'package:kb_mobile_app/modules/dreams_intervention/submodules/non_agyw/models/non_agyw_enrollment_prep_screening.dart';

class NonAgywDreamEnrollmentService {
  final String program = 'CK4iMK8b0aZ';
  final String trackedEntityType = 'XZIKX0bA8WN';
  final List<FormSection> nonAgywClientIntakeFormSections =
      NonAgywEnrollmentFormSection.getFormSections();
  final List<FormSection> nonAgywPrepScreeningFormSections =
      NonAgywEnrollmentPrepScreening.getFormSections();

  Future savingNonAgwyBeneficiary(
      Map dataObject,
      String trackedEntityInstance,
      String orgUnit,
      String enrollment,
      String enrollmentDate,
      String incidentDate,
      List<String> hiddenFields) async {
    List<String> inputFieldIds = hiddenFields ?? [];
    inputFieldIds
        .addAll(FormUtil.getFormFieldIds(nonAgywClientIntakeFormSections));
    inputFieldIds
        .addAll(FormUtil.getFormFieldIds(nonAgywPrepScreeningFormSections));

    TrackeEntityInstance trackeEntityInstanceData =
        FormUtil.geTrackedEntityInstanceEnrollmentPayLoad(trackedEntityInstance,
            trackedEntityType, orgUnit, inputFieldIds, dataObject);
    await FormUtil.savingTrackeEntityInstance(trackeEntityInstanceData);
    Enrollment enrollmentData = FormUtil.getEnrollmentPayLoad(enrollment,
        enrollmentDate, incidentDate, orgUnit, program, trackedEntityInstance);
    await FormUtil.savingEnrollment(enrollmentData);
  }

  Future<List<AgywDream>> getNonAgywBenficiaryList() async {
    List<AgywDream> agywDreamList = [];
    try {
      List<Enrollment> enrollments =
          await EnrollmentOfflineProvider().getEnrollements(program);
      for (Enrollment enrollment in enrollments) {
        // get location
        List<OrganisationUnit> ous = await OrganisationUnitService()
            .getOrganisationUnits([enrollment.orgUnit]);
        String location = ous.length > 0 ? ous[0].name : enrollment.orgUnit;
        String orgUnit = enrollment.orgUnit;
        String createdDate = enrollment.enrollmentDate;
        String enrollmentId = enrollment.enrollment;
        List<TrackeEntityInstance> dataHolds =
            await TrackedEntityInstanceOfflineProvider().getTrackedEntityInstance([enrollment.trackedEntityInstance]);
        for (TrackeEntityInstance tei in dataHolds) {
          try {
            agywDreamList.add(AgywDream().fromTeiModel(
                tei, orgUnit, location, createdDate, enrollmentId));
          } catch (e) {
            print(e);
          }
        }
      }
    } catch (e) {}

    return agywDreamList;
  }
}
