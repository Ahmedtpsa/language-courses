trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {
    List<String> messages = new List<String>();

    if (Trigger.isInsert) {
        for (Language_Course__c course : Trigger.new) {
            messages.add('New Language Course created: ' + course.Name);
        }
    } else if (Trigger.isUpdate) {
        for (Language_Course__c course : Trigger.new) {
            messages.add('Language Course updated: ' + course.Name);
        }
    } else if (Trigger.isDelete) {
        for (Language_Course__c course : Trigger.old) {
            messages.add('Language Course deleted: ' + course.Name);
        }
    }

    for (String msg : messages) {
        System.debug(msg);
    }
}