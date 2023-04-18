use strict;
use warnings;
use DBI;

# Connect to MySQL database
my $dbh = DBI->connect("DBI:mysql:database=school;host=localhost", "root", "")
  or die "Error connecting to MySQL database: $DBI::errstr\n";

# Define variables
my $choice;
my $id;
my $name;
my $class;
my $section;

# Menu options
sub menu {
  print "School Management System\n";
  print "1. Add student\n";
  print "2. Remove student\n";
  print "3. View student details\n";
  print "4. Add course\n";
   print "5. View all courses\n";
   print "6. Add teacher\n";
print "7. View all teachers\n";
print "8. Enroll student in course\n";
print "9. View all enrollments\n";
  print "10. Exit\n";
  print "Enter your choice: ";
  chomp($choice = <STDIN>);
}

# Add a student
sub add_student {
  print "Enter student id: ";
  chomp($id = <STDIN>);
  print "Enter student name: ";
  chomp($name = <STDIN>);
  print "Enter student class: ";
  chomp($class = <STDIN>);
  print "Enter student section: ";
  chomp($section = <STDIN>);
  
  # Prepare SQL statement to insert student data
  my $sth = $dbh->prepare("INSERT INTO students (id, name, class, section) VALUES (?, ?, ?, ?)");
  $sth->execute($id, $name, $class, $section);
  print "Student added successfully!\n";
}

# Remove a student
sub remove_student {
  print "Enter student id: ";
  chomp($id = <STDIN>);
  
  # Prepare SQL statement to delete student data
  my $sth = $dbh->prepare("DELETE FROM students WHERE id = ?");
  $sth->execute($id);
  if ($sth->rows == 1) {
    print "Student removed successfully!\n";
  } else {
    print "Student not found.\n";
  }
}

# View student details
sub view_student_details {
  print "Enter student id: ";
  chomp($id = <STDIN>);
  
  # Prepare SQL statement to retrieve student data
  my $sth = $dbh->prepare("SELECT * FROM students WHERE id = ?");
  $sth->execute($id);
  if (my $row = $sth->fetchrow_hashref) {
    print "Student details:\n";
    print "ID: $row->{id}\n";
    print "Name: $row->{name}\n";
    print "Class: $row->{class}\n";
    print "Section: $row->{section}\n";
  } else {
    print "Student not found.\n";
  }
}

# Add a course
sub add_course {
  print "Enter course name: ";
  my $name = <STDIN>;
  chomp($name);

  # Prepare SQL statement to insert course data
  my $sth = $dbh->prepare("INSERT INTO courses (name) VALUES (?)");
  $sth->execute($name);
  print "Course added successfully!\n";
}

# View all courses
sub view_courses {
  # Prepare SQL statement to retrieve all courses
  my $sth = $dbh->prepare("SELECT * FROM courses");
  $sth->execute();
  print "List of all courses:\n";
  while (my $row = $sth->fetchrow_hashref) {
    print "$row->{id}. $row->{name}\n";
  }
}

# Add a teacher
sub add_teacher {
  print "Enter teacher name: ";
  my $name = <STDIN>;
  chomp($name);

  # Prepare SQL statement to insert teacher data
  my $sth = $dbh->prepare("INSERT INTO teachers (name) VALUES (?)");
  $sth->execute($name);
  print "Teacher added successfully!\n";
}

# View all teachers
sub view_teachers {
  # Prepare SQL statement to retrieve all teachers
  my $sth = $dbh->prepare("SELECT * FROM teachers");
  $sth->execute();
  print "List of all teachers:\n";
  while (my $row = $sth->fetchrow_hashref) {
    print "$row->{id}. $row->{name}\n";
  }
}

# Enroll a student in a course
sub enroll_student {
  print "Enter student ID: ";
  my $student_id = <STDIN>;
  chomp($student_id);

  # Prepare SQL statement to retrieve all courses
  my $sth = $dbh->prepare("SELECT * FROM courses");
  $sth->execute();
  print "List of all courses:\n";
  while (my $row = $sth->fetchrow_hashref) {
    print "$row->{id}. $row->{name}\n";
  }

  print "Enter course ID to enroll student: ";
  my $course_id = <STDIN>;
  chomp($course_id);

  # Prepare SQL statement to enroll student in course
  $sth = $dbh->prepare("INSERT INTO enrollments (student_id, course_id) VALUES (?, ?)");
  $sth->execute($student_id, $course_id);
  print "Student enrolled successfully!\n";
}

# View all enrollments
sub view_enrollments {
  # Prepare SQL statement to retrieve all enrollments
  my $sth = $dbh->prepare("SELECT students.name AS student_name, courses.name AS course_name FROM enrollments JOIN students ON enrollments.student_id = students.id JOIN courses ON enrollments.course_id = courses.id");
  $sth->execute();
  print "List of all enrollments:\n";
  while (my $row = $sth->fetchrow_hashref) {
    print "$row->{student_name} enrolled in $row->{course_name}\n";
  }
}

# Main program
while (1) {
  menu();
  if ($choice == 1) {
    add_student();
  } elsif ($choice == 2) {
    remove_student();
  } elsif ($choice == 3) {
    view_student_details();
    } elsif ($choice == 4) {
    add_course();
    } elsif ($choice == 5) {
    view_courses();
    } elsif ($choice == 6) {
    add_teacher();
    } elsif ($choice == 7) {
    view_teachers();
    } elsif ($choice == 8) {
    enroll_student();
    } elsif ($choice == 9) {
    view_enrollments();
  } elsif ($choice == 10) {
    last;
  } else {
    print "Invalid choice.\n";
  }
}

# Disconnect from MySQL database
$dbh->disconnect();
print "Thank you for using the School Management System!\n";
