@isTest
private class TestLanguageCourseTrigger {

    @isTest
    static void testInsertCourse() {
        Language_Course__c course = new Language_Course__c(Name = 'Spanish 101');

        Test.startTest();
        insert course;
        Test.stopTest();

        Language_Course__c inserted = [SELECT Id, Name FROM Language_Course__c WHERE Id = :course.Id];
        System.assertEquals('Spanish 101', inserted.Name);
    }

    @isTest
    static void testUpdateCourse() {
        Language_Course__c course = new Language_Course__c(Name = 'French 101');
        insert course;

        course.Name = 'French 201';
        Test.startTest();
        update course;
        Test.stopTest();

        Language_Course__c updated = [SELECT Id, Name FROM Language_Course__c WHERE Id = :course.Id];
        System.assertEquals('French 201', updated.Name);
    }

    @isTest
    static void testDeleteCourse() {
        Language_Course__c course = new Language_Course__c(Name = 'German 101');
        insert course;

        Test.startTest();
        delete course;
        Test.stopTest();

        List<Language_Course__c> remaining = [SELECT Id FROM Language_Course__c WHERE Id = :course.Id];
        System.assertEquals(0, remaining.size());
    }
}
