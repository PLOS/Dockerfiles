    create table annotation (
        annotationID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        type varchar(255) not null,
        userProfileID bigint not null,
        articleID bigint not null,
        annotationURI varchar(255) unique,
        parentID bigint,
        title longtext,
        body longtext,
        highlightedText longtext,
        competingInterestBody longtext,
        primary key (annotationID)
    );

    create table annotationFlag (
        annotationFlagID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        reason varchar(255) not null,
        userProfileID bigint not null,
        annotationID bigint not null,
        comment longtext,
        primary key (annotationFlagID)
    );

    create table article (
        articleID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        doi varchar(255) not null unique,
        title longtext,
        eIssn varchar(255),
        state integer,
        archiveName varchar(255),
        description longtext,
        rights longtext,
        language varchar(255),
        format varchar(255),
        pages varchar(255),
        eLocationId varchar(255),
        url varchar(255),
        strkImgURI varchar(255),
        date datetime,
        volume varchar(255),
        issue varchar(255),
        journal varchar(255),
        publisherLocation varchar(255),
        publisherName varchar(255),
        primary key (articleID)
    );

    create table articleAsset (
        articleAssetID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        doi varchar(255) not null,
        extension varchar(255) not null,
        contextElement varchar(255),
        contentType varchar(255),
        title longtext,
        description longtext,
        size bigint,
        articleID bigint,
        sortOrder integer,
        primary key (articleAssetID),
        unique (doi, extension)
    );

    create table articleCategoryJoinTable (
        articleID bigint not null,
        weight integer not null,
        categoryID bigint not null,
        primary key (articleID, categoryID)
    );

    create table articleCollaborativeAuthors (
        articleID bigint not null,
        name varchar(255),
        sortOrder integer not null,
        primary key (articleID, sortOrder)
    );

    create table articleList (
        articleListID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        listCode varchar(255) not null unique,
        displayName varchar(255),
        journalID bigint,
        journalSortOrder integer,
        primary key (articleListID)
    );

    create table articleListJoinTable (
        articleListID bigint not null,
        doi varchar(255),
        sortOrder integer not null,
        primary key (articleListID, sortOrder)
    );

    create table articlePerson (
        articlePersonID bigint not null auto_increment,
        type varchar(255) not null,
        lastModified datetime not null,
        created datetime not null,
        fullName varchar(255),
        givenNames varchar(255),
        surnames varchar(255),
        suffix varchar(255),
        articleID bigint,
        sortOrder integer,
        primary key (articlePersonID)
    );

    create table articlePublishedJournals (
        articleID bigint not null,
        journalID bigint not null,
        primary key (articleID, journalID)
    );

    create table articleRelationship (
        articleRelationshipID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        parentArticleID bigint not null,
        otherArticleDoi varchar(255),
        otherArticleID bigint,
        type varchar(255),
        sortOrder integer,
        primary key (articleRelationshipID)
    );

    create table articleType (
        articleID bigint not null,
        type varchar(255)
    );

    create table category (
        categoryID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        path varchar(255) unique,
        primary key (categoryID)
    );

    create table citedArticle (
        citedArticleID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        keyColumn varchar(255),
        year integer,
        displayYear varchar(255),
        month varchar(255),
        day varchar(255),
        volumeNumber integer,
        volume varchar(255),
        issue varchar(255),
        title longtext,
        publisherLocation varchar(255),
        publisherName varchar(255),
        pages varchar(255),
        eLocationID varchar(255),
        journal varchar(255),
        note longtext,
        url varchar(255),
        doi varchar(255),
        citationType varchar(255),
        summary longtext,
        articleID bigint,
        sortOrder integer,
        primary key (citedArticleID)
    );

    create table citedArticleCollaborativeAuthors (
        citedArticleID bigint not null,
        name varchar(255),
        sortOrder integer not null,
        primary key (citedArticleID, sortOrder)
    );

    create table citedPerson (
        citedPersonID bigint not null auto_increment,
        type varchar(255) not null,
        lastModified datetime not null,
        created datetime not null,
        fullName varchar(255),
        givenNames varchar(255),
        surnames varchar(255),
        suffix varchar(255),
        citedArticleID bigint,
        sortOrder integer,
        primary key (citedPersonID)
    );

    create table issue (
        issueID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        issueUri varchar(255) not null unique,
        displayName varchar(255),
        respectOrder bit,
        imageUri varchar(255),
        title varchar(255),
        description longtext,
        volumeID bigint,
        volumeSortOrder integer,
        primary key (issueID)
    );

    create table issueArticleList (
        issueID bigint not null,
        doi varchar(255),
        sortOrder integer not null,
        primary key (issueID, sortOrder)
    );

    create table journal (
        journalID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        journalKey varchar(255) unique,
        eIssn varchar(255) unique,
        imageUri varchar(255),
        title varchar(255),
        description longtext,
        currentIssueID bigint,
        primary key (journalID)
    );

    create table pingback (
        pingbackID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        articleID bigint not null,
        url varchar(255) not null,
        title varchar(255),
        primary key (pingbackID),
        unique (articleID, url)
    );

    create table savedSearch (
        savedSearchID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        lastWeeklySearchTime datetime not null,
        lastMonthlySearchTime datetime not null,
        searchName varchar(255),
        searchType varchar(255) not null,
        weekly bit,
        monthly bit,
        savedSearchQueryID bigint not null,
        userProfileID bigint not null,
        primary key (savedSearchID)
    );

    create table savedSearchQuery (
        savedSearchQueryID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        hash varchar(50) not null unique,
        searchParams longtext,
        primary key (savedSearchQueryID)
    );

    create table syndication (
        syndicationID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        doi varchar(255) not null,
        target varchar(50) not null,
        status varchar(50),
        submissionCount integer,
        errorMessage longtext,
        lastSubmitTimestamp datetime,
        primary key (syndicationID),
        unique (doi, target)
    );

    create table trackback (
        trackbackID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        articleID bigint not null,
        url varchar(255) not null,
        title varchar(255),
        blogName varchar(255) not null,
        excerpt varchar(255) not null,
        primary key (trackbackID),
        unique (articleID, url)
    );

    create table userArticleView (
        userArticleViewID bigint not null auto_increment,
        created datetime not null,
        articleID bigint not null,
        userProfileID bigint not null,
        type varchar(255) not null,
        primary key (userArticleViewID)
    );

    create table userLogin (
        userLoginID bigint not null auto_increment,
        created datetime not null,
        userProfileID bigint not null,
        sessionID varchar(255),
        IP varchar(255),
        userAgent varchar(255),
        primary key (userLoginID)
    );

    create table userOrcid (
        userProfileID bigint not null,
        lastModified datetime not null,
        created datetime not null,
        orcid varchar(25),
        accessToken varchar(50),
        refreshToken varchar(50),
        tokenScope varchar(100),
        tokenExpires datetime,
        primary key (userProfileID)
    );

    create table userProfile (
        userProfileID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        email varchar(255) unique,
        password longtext not null,
        verificationToken longtext,
        authId varchar(255) not null unique,    -- this line was edited from the original because of an error msg
        verified bit not null,
        displayName varchar(255) unique,
        userProfileURI varchar(100) not null,
        realName longtext,
        givenNames varchar(255),
        surName varchar(15),
        title varchar(255),
        gender varchar(15),
        homePage longtext,
        weblog longtext,
        publications varchar(255),
        suffix varchar(255),
        positionType varchar(255),
        organizationName longtext,
        organizationType varchar(255),
        city varchar(255),
        country varchar(255),
        organizationVisibility bit not null,
        researchAreas longtext,
        postalAddress longtext,
        alertsJournals longtext,
        biography longtext,
        interests longtext,
        primary key (userProfileID)
    );

    create table userProfileMetaData (
        userProfileMetaDataID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        userProfileID bigint not null,
        metaKey varchar(50),
        metaValue varchar(255),
        primary key (userProfileMetaDataID)
    );

    create table userProfileRoleJoinTable (
        userProfileID bigint not null,
        userRoleID bigint not null,
        primary key (userProfileID, userRoleID)
    );

    create table userRole (
        userRoleID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        roleName varchar(255) not null unique,
        primary key (userRoleID)
    );

    create table userRolePermission (
        userRoleID bigint not null,
        permission varchar(255)
    );

    create table userSearch (
        userSearchID bigint not null auto_increment,
        created datetime not null,
        userProfileID bigint not null,
        searchString varchar(255),
        searchTerms varchar(255),
        primary key (userSearchID)
    );

    create table version (
        versionID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        version integer,
        name varchar(255),
        updateInProcess bit,
        primary key (versionID)
    );

    create table volume (
        volumeID bigint not null auto_increment,
        lastModified datetime not null,
        created datetime not null,
        volumeUri varchar(255) not null unique,
        displayName varchar(255),
        imageUri varchar(255),
        title varchar(255),
        description longtext,
        journalID bigint,
        journalSortOrder integer,
        primary key (volumeID)
    );

    alter table annotation 
        add index FKA34FEB2F78B0DAE3 (userProfileID), 
        add constraint FKA34FEB2F78B0DAE3 
        foreign key (userProfileID) 
        references userProfile (userProfileID);

    alter table annotationFlag 
        add index FK561A2F3BB123DFCD (annotationID), 
        add constraint FK561A2F3BB123DFCD 
        foreign key (annotationID) 
        references annotation (annotationID);

    alter table annotationFlag 
        add index FK561A2F3B78B0DAE3 (userProfileID), 
        add constraint FK561A2F3B78B0DAE3 
        foreign key (userProfileID) 
        references userProfile (userProfileID);

    alter table articleAsset 
        add index FKE6D8D79ADFD5CDF3 (articleID), 
        add constraint FKE6D8D79ADFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table articleCategoryJoinTable 
        add index FK5E567710AA9840AB (categoryID), 
        add constraint FK5E567710AA9840AB 
        foreign key (categoryID) 
        references category (categoryID);

    alter table articleCategoryJoinTable 
        add index FK5E567710DFD5CDF3 (articleID), 
        add constraint FK5E567710DFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table articleCollaborativeAuthors 
        add index FK204FE589DFD5CDF3 (articleID), 
        add constraint FK204FE589DFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table articleList 
        add index FK30C186B4FA7E0635 (journalID), 
        add constraint FK30C186B4FA7E0635 
        foreign key (journalID) 
        references journal (journalID);

    alter table articleListJoinTable 
        add index FKA693FC704946C7CF (articleListID), 
        add constraint FKA693FC704946C7CF 
        foreign key (articleListID) 
        references articleList (articleListID);

    alter table articlePerson 
        add index FKD1543EBDFD5CDF3 (articleID), 
        add constraint FKD1543EBDFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table articlePublishedJournals 
        add index FK5D8BADD4DFD5CDF3 (articleID), 
        add constraint FK5D8BADD4DFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table articlePublishedJournals 
        add index FK5D8BADD4FA7E0635 (journalID), 
        add constraint FK5D8BADD4FA7E0635 
        foreign key (journalID) 
        references journal (journalID);

    alter table articleRelationship 
        add index FKA59ED64EAFD8E489 (parentArticleID), 
        add constraint FKA59ED64EAFD8E489 
        foreign key (parentArticleID) 
        references article (articleID);

    alter table articleType 
        add index FK30C56550DFD5CDF3 (articleID), 
        add constraint FK30C56550DFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table citedArticle 
        add index FK74E3E49DFD5CDF3 (articleID), 
        add constraint FK74E3E49DFD5CDF3 
        foreign key (articleID) 
        references article (articleID);

    alter table citedArticleCollaborativeAuthors 
        add index FKE0BA6F5C8F1352A1 (citedArticleID), 
        add constraint FKE0BA6F5C8F1352A1 
        foreign key (citedArticleID) 
        references citedArticle (citedArticleID);

    alter table citedPerson 
        add index FK29A133A28F1352A1 (citedArticleID), 
        add constraint FK29A133A28F1352A1 
        foreign key (citedArticleID) 
        references citedArticle (citedArticleID);

    alter table issue 
        add index FK5FDA8D93E7BB2E3 (volumeID), 
        add constraint FK5FDA8D93E7BB2E3 
        foreign key (volumeID) 
        references volume (volumeID);

    alter table issueArticleList 
        add index FKF829B41BAB6843F9 (issueID), 
        add constraint FKF829B41BAB6843F9 
        foreign key (issueID) 
        references issue (issueID);

    alter table journal 
        add index FKAB64AF37E96C1C60 (currentIssueID), 
        add constraint FKAB64AF37E96C1C60 
        foreign key (currentIssueID) 
        references issue (issueID);

    alter table savedSearch 
        add index FK3407F0F78B0DAE3 (userProfileID), 
        add constraint FK3407F0F78B0DAE3 
        foreign key (userProfileID) 
        references userProfile (userProfileID);

    alter table savedSearch 
        add index FK3407F0F78328E21 (savedSearchQueryID), 
        add constraint FK3407F0F78328E21 
        foreign key (savedSearchQueryID) 
        references savedSearchQuery (savedSearchQueryID);

    alter table userProfileRoleJoinTable 
        add index FK57F48A3078B0DAE3 (userProfileID), 
        add constraint FK57F48A3078B0DAE3 
        foreign key (userProfileID) 
        references userProfile (userProfileID);

    alter table userProfileRoleJoinTable 
        add index FK57F48A30DDEDF391 (userRoleID), 
        add constraint FK57F48A30DDEDF391 
        foreign key (userRoleID) 
        references userRole (userRoleID);

    alter table userRolePermission 
        add index FK2E3B3F90DDEDF391 (userRoleID), 
        add constraint FK2E3B3F90DDEDF391 
        foreign key (userRoleID) 
        references userRole (userRoleID);

    alter table volume 
        add index FKCFAAE71AFA7E0635 (journalID), 
        add constraint FKCFAAE71AFA7E0635 
        foreign key (journalID) 
        references journal (journalID);
