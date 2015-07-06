<div class="top-header">
  <span class="heading">Save this journal alert</span>
</div>

<div class="body-wrapper">
  <#if subscribed>
    <div class="check-box"><strong>You are currently subscribed to:</strong>
      ${category!""}
    </div>
    <div class="grey-text">
      You can change these options by clicking <a href="/user/secure/profile">profile</a> then "Journal Alerts"
      Would you like to unsubscribe?
    </div>
    <div class="button-wrapper">
      <input type="button" class="primary" id="btn-unsubscribe-journal-alert" value="Unsubscribe"/>
      <input type="button" class="btn-cancel-alert" value="Cancel"/>
      <span class="errortext" id="save-journal-alert-error"></span>
    </div>
  <#else>
    <#if (subjectCount >= 12) >
      <div class="check-box">
        <strong>You cannot subscribe to more than 12 subject areas.</strong>
      </div>
      <div class="grey-text">
        You can change your subscription preferences by clicking <a href="/user/secure/profile">profile</a> then "Journal Alerts"
      </div>
      <div class="button-wrapper">
        <input type="button" class="btn-cancel-alert" value="Cancel"/>
      </div>
    <#else>
      <div class="check-box"><strong>Create a weekly email alert for:</strong>
        ${category!""}
      </div>
      <div class="grey-text">
        You can change these options by clicking <a href="/user/secure/profile">profile</a> then "Journal Alerts"
      </div>
      <div class="button-wrapper">
        <input type="button" class="primary" id="btn-save-journal-alert" value="Save"/>
        <input type="button" class="btn-cancel-alert" value="Cancel"/>
        <span class="errortext" id="save-journal-alert-error"></span>
      </div>
    </#if>
  </#if>
</div>