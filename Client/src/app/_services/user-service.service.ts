import { Injectable } from '@angular/core';
import { User } from '../_pages/System Admin/users/user';
import { users } from '../_pages/System Admin/users/user-data';
import { Observable, from } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  public users: User[] = users;

  getUsers(): Observable<User> {
    return from(this.users);
  }

  deleteUser(id: number): void {
    this.users = this.users.filter(user => user.id !== id);
  }

  addUser(user: User): void {
    this.users?.push(user);
  }

  updateUser(index: number, user: User): void {
    this.users[index] = user;
  }
}
