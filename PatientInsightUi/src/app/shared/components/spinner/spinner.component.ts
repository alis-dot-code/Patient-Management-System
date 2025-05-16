import { Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-spinner',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div *ngIf="show" class="spinner-overlay">
      <div class="loader"></div>
      <p *ngIf="message" class="message">{{ message }}</p>
    </div>
  `,
  styles: [`
    .spinner-overlay { /* styling for centering and overlay */ }
    .loader { /* pure css spinner */ }
    .message { /* styling */ }
  `]
})
export class SpinnerComponent {
  @Input() show = false;
  @Input() message = 'Loading...';
}
