import { Component } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { AppService } from './app.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {

  constructor(private fb: FormBuilder, private appService: AppService) {}

  userForm = this.fb.group({
    name: [null, Validators.required],
    mobile: [null, Validators.required],
    email: [null, [Validators.required, Validators.email]],
    dob: [null, Validators.required],
  });

  register() {
    if (this.userForm.valid) {
      this.appService.registerUser(this.userForm.value).subscribe(
        (res) => {
          this.userForm.reset();
          alert('Successfully Created');
        },
        (err) => {
          console.log(`Err:::: ${err}`);
        }
      );
    } else {
      this.userForm.markAllAsTouched();
    }
  }
}
