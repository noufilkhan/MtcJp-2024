import { AfterViewInit, Component } from '@angular/core';

import { ChatComponent } from '../../_components/dashboard-components/recent-chats/chat.component';
import { CampaignOverviewComponent } from '../../_components/dashboard-components/campaign-overview/co.component';
import { MixstatsComponent } from '../../_components/dashboard-components/mix-stats/mix-stats.component';
import { ProjectComponent } from '../../_components/dashboard-components/project/project.component';
import { CommentComponent } from '../../_components/dashboard-components/recent-comments/comment.component';
import { RpbComponent } from '../../_components/dashboard-components/revenue-page-bounce/rpb.component';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    MixstatsComponent,
    RpbComponent,
    ProjectComponent,
    CommentComponent,
    ChatComponent,
    CampaignOverviewComponent
  ],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.scss'
})
export class DashboardComponent implements AfterViewInit {
  constructor() {}

  ngAfterViewInit() {}
}
