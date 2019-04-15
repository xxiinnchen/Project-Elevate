Feature: (D)elevate other users as Admin
 
    As an admin
    I want to see the correct membership statuses
    So that I can validly (d)elevate users to other membership statuses

Background: Users in the Database

 Given the following users exist:
  | name            | email                    | password | membership    |
  | Joe Chen        | chenjoe@gmail.com        | 88888888 | Club Member   |
  | Matthew Sie     | matthew.sie@berkeley.edu | dabaka22 | Administrator |
  | Roger Destroyer | rogerahh@gmail.com       | 12345678 | Coach         |
  | John Doe        | johndoe@gmail.com        | 12345678 | Manager       |

And I go to Login page

# Note that I need to specify passwords here because the authentication process won't let me access user password 
# All scenarios begin assuming no user is logged in yet
Scenario: Update Membership as Admin (elevate)
  Given "Matthew Sie" logs in with correct password "dabaka22" and goes to profile page
  And selects status "Manager" for "Joe Chen"
  When I press "Joe Chen_update"
  Then he should see membership status "Manager" for "Joe Chen"

Scenario: Update Membership as Admin (delevate)
  Given "Matthew Sie" logs in with correct password "dabaka22" and goes to profile page
  And selects status "Club Member" for "Roger Destroyer"
  When I press "Roger Destroyer_update"
  Then he should see membership status "Club Member" for "Roger Destroyer"
