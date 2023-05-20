import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AppService {

  constructor(private http: HttpClient) { }

  registerUser(payload: any) {
    return this.http.post('http://localhost:8080/user', payload);
  }
}
