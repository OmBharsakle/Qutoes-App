// Categories Image List


import 'dart:math';

Map<String, List<Map<String, String>>> CategoriesImageList = {
  "ToughTimes": [
    {"link": "assets/Images/img/Tough_Times/alone.jpg", "text": "Alone"},
    {"link": "assets/Images/img/Tough_Times/anger.jpg", "text": "Anger"},
    {"link": "assets/Images/img/Tough_Times/breakup.jpg", "text": "Breakup"},
    {
      "link": "assets/Images/img/Tough_Times/broken_heart.jpg",
      "text": "Broken Heart"
    },
    {"link": "assets/Images/img/Tough_Times/death.jpg", "text": "Death"},
    {
      "link": "assets/Images/img/Tough_Times/depression.jpg",
      "text": "Depression"
    },
    {"link": "assets/Images/img/Tough_Times/divorce.jpg", "text": "Divorce"},
    {"link": "assets/Images/img/Tough_Times/jealousy.jpg", "text": "Jealousy"},
    {
      "link": "assets/Images/img/Tough_Times/loneliness.jpg",
      "text": "Loneliness"
    },
    {
      "link": "assets/Images/img/Tough_Times/losing_friend.jpg",
      "text": "Losing Friend"
    },
    {
      "link": "assets/Images/img/Tough_Times/missing_someone.jpg",
      "text": "Missing Someone"
    },
    {
      "link": "assets/Images/img/Tough_Times/overthinking.jpg",
      "text": "Overthinking"
    },
    {"link": "assets/Images/img/Tough_Times/pain.jpg", "text": "Pain"},
    {"link": "assets/Images/img/Tough_Times/sadness.jpg", "text": "Sadness"},
  ],
  "SelfDevelopment": [
    {
      "link": "assets/Images/img/Self_Development/be_strong.jpg",
      "text": "Be Strong"
    },
    {
      "link": "assets/Images/img/Self_Development/be_yourself.jpg",
      "text": "Be Yourself"
    },
    {
      "link": "assets/Images/img/Self_Development/confidence.jpg",
      "text": "Confidence"
    },
    {
      "link": "assets/Images/img/Self_Development/courage.jpg",
      "text": "Courage"
    },
    {"link": "assets/Images/img/Self_Development/dream.jpg", "text": "Dream"},
    {
      "link": "assets/Images/img/Self_Development/love_yourself.jpg",
      "text": "Love Yourself"
    },
    {
      "link": "assets/Images/img/Self_Development/no_excuse.jpg",
      "text": "No Excuse"
    },
    {
      "link": "assets/Images/img/Self_Development/overcoming_failure.jpg",
      "text": "Overcoming Failure"
    },
    {
      "link": "assets/Images/img/Self_Development/passion.jpg",
      "text": "Passion"
    },
    {
      "link": "assets/Images/img/Self_Development/positive_thinking.jpg",
      "text": "Positive Thinking"
    },
    {
      "link": "assets/Images/img/Self_Development/self_care.jpg",
      "text": "Self Care"
    },
    {
      "link": "assets/Images/img/Self_Development/self_development.jpg",
      "text": "Self Development"
    },
    {
      "link": "assets/Images/img/Self_Development/self_discipline.jpg",
      "text": "Self Discipline"
    },
    {
      "link": "assets/Images/img/Self_Development/self_respect.jpg",
      "text": "Self Respect"
    },
    {"link": "assets/Images/img/Self_Development/smile.jpg", "text": "Smile"},
    {"link": "assets/Images/img/Self_Development/wisdom.jpg", "text": "Wisdom"},
  ],
  "ReligiousAndSpritual": [
    {
      "link": "assets/Images/img/Religious_And_Spritual/affirmation.jpg",
      "text": "Affirmation"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/blessed.jpg",
      "text": "Blessed"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/buddha.jpg",
      "text": "Buddha"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/devotion.jpg",
      "text": "Devotion"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/faith.jpg",
      "text": "Faith"
    },
    {"link": "assets/Images/img/Religious_And_Spritual/god.jpg", "text": "God"},
    {
      "link": "assets/Images/img/Religious_And_Spritual/happiness.jpg",
      "text": "Happiness"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/healing.jpg",
      "text": "Healing"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/Hinduism.jpg",
      "text": "Hinduism"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/hope.jpg",
      "text": "Hope"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/inner_beauty.jpg",
      "text": "Inner Beauty"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/karma.jpg",
      "text": "Karma"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/law_of_attraction.jpg",
      "text": "Law Of Attraction"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/Life.jpg",
      "text": "Life"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/peace.jpg",
      "text": "Peace"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/quran.jpg",
      "text": "Quran"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/silence.jpg",
      "text": "Silence"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/simplicity.jpg",
      "text": "Simplicity"
    },
  ],
  "Others": [
    {"link": "assets/Images/img/Others/anniversary.jpg", "text": "Anniversary"},
    {"link": "assets/Images/img/Others/birthday.jpg", "text": "Birthday"},
    {"link": "assets/Images/img/Others/fathers_day.jpg", "text": "Fathers Day"},
    {"link": "assets/Images/img/Others/forgiveness.jpg", "text": "Forgiveness"},
    {
      "link": "assets/Images/img/Others/good_morning.jpg",
      "text": "Good Morning"
    },
    {"link": "assets/Images/img/Others/good_night.jpg", "text": "Good Night"},
    {"link": "assets/Images/img/Others/helpful.jpg", "text": "Helpful"},
    {"link": "assets/Images/img/Others/honesty.jpg", "text": "Honesty"},
    {"link": "assets/Images/img/Others/kindness.jpg", "text": "Kindness"},
    {"link": "assets/Images/img/Others/loyalty.jpg", "text": "Loyalty"},
    {"link": "assets/Images/img/Others/mothers_day.jpg", "text": "Mothers Day"},
    {"link": "assets/Images/img/Others/respect.jpg", "text": "Respect"},
    {"link": "assets/Images/img/Others/thank_you.jpg", "text": "Thank You"},
  ],
  "MotivationAndInspiration": [
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/attitude.jpg",
      "text": "Attitude"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/creativity.jpg",
      "text": "Creativity"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/freedom.jpg",
      "text": "Freedom"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/funny.jpg",
      "text": "Funny"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/learning.jpg",
      "text": "Learning"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/positivity.jpg",
      "text": "Positivity"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/success.jpg",
      "text": "Success"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/time.jpg",
      "text": "Time"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/travel.jpg",
      "text": "Travel"
    },
  ],
  "LoveAndRelationship": [
    {
      "link": "assets/Images/img/Love_And_Relationship/best_friend.jpg",
      "text": "Best Friend"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/deep_love.jpg",
      "text": "Deep Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/falling_in_love.jpg",
      "text": "Falling In Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/flirt.jpg",
      "text": "Flirt"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/friendship.jpg",
      "text": "Friendship"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/funny_love.jpg",
      "text": "Funny Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/love.jpg",
      "text": "Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/marriage.jpg",
      "text": "Marriage"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/one_sided_love.jpg",
      "text": "One Sided Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/relationship.jpg",
      "text": "Relationship"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/romantic.jpg",
      "text": "Romantic"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/trust.jpg",
      "text": "Trust"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/unconditional_love.jpg",
      "text": "Unconditional Love"
    },
  ],
  "HealthAndFitness": [
    {
      "link": "assets/Images/img/Health_And_Fitness/exercise.jpg",
      "text": "Exercise"
    },
    {
      "link": "assets/Images/img/Health_And_Fitness/fitness.jpg",
      "text": "Fitness"
    },
    {"link": "assets/Images/img/Health_And_Fitness/gym.jpg", "text": "Gym"},
    {
      "link": "assets/Images/img/Health_And_Fitness/health.jpg",
      "text": "Health"
    },
    {
      "link": "assets/Images/img/Health_And_Fitness/healthy%20eating.jpg",
      "text": "Healthy Eating"
    },
  ],
  "Entrepreneurship": [
    {
      "link": "assets/Images/img/Entrepreneurship/business.jpg",
      "text": "Business"
    },
    {
      "link": "assets/Images/img/Entrepreneurship/entrepreneur.jpg",
      "text": "Entrepreneur"
    },
    {
      "link": "assets/Images/img/Entrepreneurship/financial_freedom.jpg",
      "text": "Financial Freedom"
    },
    {"link": "assets/Images/img/Entrepreneurship/hustle.jpg", "text": "Hustle"},
    {
      "link": "assets/Images/img/Entrepreneurship/leadership.jpg",
      "text": "Leadership"
    },
    {"link": "assets/Images/img/Entrepreneurship/money.jpg", "text": "Money"},
  ],
};

// Categories Text List

List CategoriesTextList = [
  'Tough Times',
  'Self Development',
  'Religious And Spiritual',
  'Others',
  'Motivation And Inspiration',
  'Love And Relationship',
  'Health And Fitness',
  'Entrepreneurship'
];

// Wallpaper

List Themes = [
  {'link': "assets/Images/img/Themes/1.jpg"},
  {'link': "assets/Images/img/Themes/2.jpg"},
  {'link': "assets/Images/img/Themes/3.jpg"},
  {'link': "assets/Images/img/Themes/4.jpg"},
  {'link': "assets/Images/img/Themes/5.jpg"},
  {'link': "assets/Images/img/Themes/6.jpg"},
  {'link': "assets/Images/img/Themes/7.jpg"},
  {'link': "assets/Images/img/Themes/8.jpg"},
  {'link': "assets/Images/img/Themes/9.jpg"},
  {'link': "assets/Images/img/Themes/10.jpg"},
  {'link': "assets/Images/img/Themes/11.jpg"},
  {'link': "assets/Images/img/Themes/12.jpg"},
  {'link': "assets/Images/img/Themes/13.jpg"},
  {'link': "assets/Images/img/Themes/14.jpg"},
  {'link': "assets/Images/img/Themes/15.jpg"},
  {'link': "assets/Images/img/Themes/16.jpg"},
  {'link': "assets/Images/img/Themes/17.jpg"},
  {'link': "assets/Images/img/Themes/18.jpg"},
  {'link': "assets/Images/img/Themes/19.jpg"},
  {'link': "assets/Images/img/Themes/20.jpg"},
  {'link': "assets/Images/img/Themes/21.jpg"},
  {'link': "assets/Images/img/Themes/22.jpg"},
  {'link': "assets/Images/img/Themes/23.jpg"},
  {'link': "assets/Images/img/Themes/24.jpg"},
  {'link': "assets/Images/img/Themes/25.jpg"},
  {'link': "assets/Images/img/Themes/26.jpg"},
  {'link': "assets/Images/img/Themes/27.jpg"},
  {'link': "assets/Images/img/Themes/28.jpg"},
  {'link': "assets/Images/img/Themes/29.jpg"},
  {'link': "assets/Images/img/Themes/30.jpg"},
  {'link': "assets/Images/img/Themes/31.jpg"},
  {'link': "assets/Images/img/Themes/32.jpg"},
  {'link': "assets/Images/img/Themes/33.jpg"},
  {'link': "assets/Images/img/Themes/34.jpg"},
  {'link': "assets/Images/img/Themes/35.jpg"},
  {'link': "assets/Images/img/Themes/36.jpg"},
  {'link': "assets/Images/img/Themes/37.jpg"},
  {'link': "assets/Images/img/Themes/38.jpg"},
  {'link': "assets/Images/img/Themes/39.jpg"},
  {'link': "assets/Images/img/Themes/40.jpg"},
  {'link': "assets/Images/img/Themes/41.jpg"},
  {'link': "assets/Images/img/Themes/42.jpg"},
  {'link': "assets/Images/img/Themes/43.jpg"},
  {'link': "assets/Images/img/Themes/44.jpg"},
  {'link': "assets/Images/img/Themes/45.jpg"},
  {'link': "assets/Images/img/Themes/46.jpg"},
  {'link': "assets/Images/img/Themes/47.jpg"},
  {'link': "assets/Images/img/Themes/48.jpg"},
  {'link': "assets/Images/img/Themes/49.jpg"},
  {'link': "assets/Images/img/Themes/50.jpg"},
  {'link': "assets/Images/img/Themes/51.jpg"},
  {'link': "assets/Images/img/Themes/52.jpg"},
  {'link': "assets/Images/img/Themes/53.jpg"},
  {'link': "assets/Images/img/Themes/54.jpg"},
  {'link': "assets/Images/img/Themes/55.jpg"},
  {'link': "assets/Images/img/Themes/56.jpg"},
  {'link': "assets/Images/img/Themes/57.jpg"},
  {'link': "assets/Images/img/Themes/58.jpg"},
  {'link': "assets/Images/img/Themes/59.jpg"},
  {'link': "assets/Images/img/Themes/60.jpg"},
  {'link': "assets/Images/img/Themes/61.jpg"},
  {'link': "assets/Images/img/Themes/62.jpg"},
  {'link': "assets/Images/img/Themes/63.jpg"},
  {'link': "assets/Images/img/Themes/64.jpg"},
  {'link': "assets/Images/img/Themes/65.jpg"},
  {'link': "assets/Images/img/Themes/66.jpg"},
  {'link': "assets/Images/img/Themes/67.jpg"},
  {'link': "assets/Images/img/Themes/68.jpg"},
  {'link': "assets/Images/img/Themes/69.jpg"},
  {'link': "assets/Images/img/Themes/70.jpg"},
  {'link': "assets/Images/img/Themes/71.jpg"},
  {'link': "assets/Images/img/Themes/72.jpg"},
  {'link': "assets/Images/img/Themes/73.jpg"},
  {'link': "assets/Images/img/Themes/74.jpg"},
  {'link': "assets/Images/img/Themes/75.jpg"},
  {'link': "assets/Images/img/Themes/76.jpg"},
  {'link': "assets/Images/img/Themes/77.jpg"},
  {'link': "assets/Images/img/Themes/78.jpg"},
  {'link': "assets/Images/img/Themes/79.jpg"},
  {'link': "assets/Images/img/Themes/80.jpg"},
  {'link': "assets/Images/img/Themes/81.jpg"},
  {'link': "assets/Images/img/Themes/82.jpg"},
  {'link': "assets/Images/img/Themes/83.jpg"},
  {'link': "assets/Images/img/Themes/84.jpg"},
  {'link': "assets/Images/img/Themes/85.jpg"},
  {'link': "assets/Images/img/Themes/86.jpg"},
  {'link': "assets/Images/img/Themes/87.jpg"},
  {'link': "assets/Images/img/Themes/88.jpg"},
  {'link': "assets/Images/img/Themes/89.jpg"},
  {'link': "assets/Images/img/Themes/90.jpg"},
  {'link': "assets/Images/img/Themes/91.jpg"},
  {'link': "assets/Images/img/Themes/92.jpg"},
  {'link': "assets/Images/img/Themes/93.jpg"},
  {'link': "assets/Images/img/Themes/94.jpg"},
  {'link': "assets/Images/img/Themes/95.jpg"},
  {'link': "assets/Images/img/Themes/96.jpg"},
  {'link': "assets/Images/img/Themes/97.jpg"},
  {'link': "assets/Images/img/Themes/98.jpg"},
  {'link': "assets/Images/img/Themes/99.jpg"},
  {'link': "assets/Images/img/Themes/100.jpg"},
  {'link': "assets/Images/img/Themes/101.jpg"}
];

// Fonts

List fontList = [
  {
    'font': 'f1',
    'fName': 'Caveat',
  },
  {
    'font': 'f2',
    'fName': 'DM Serif Italic',
  },
  {
    'font': 'f3',
    'fName': 'DM Serif',
  },
  {
    'font': 'f4',
    'fName': 'Gwendolyn',
  },
  {
    'font': 'f5',
    'fName': 'Jacquard',
  },
  {
    'font': 'f6',
    'fName': 'Jost Italic',
  },
  {
    'font': 'f7',
    'fName': 'Pacifica',
  },
  {
    'font': 'f8',
    'fName': 'Satisfy',
  },
  {
    'font': 'f9',
    'fName': 'Teko Light',
  },
  {
    'font': 'normal',
    'fName': 'Normal',
  },
];

// Songs

List<String> Songs = [
  "01.mp3",
  "02.mp3",
  "03.mp3",
  "04.mp3",
  "05.mp3",
  "06.mp3",
  "07.mp3",
  "08.mp3",
  "09.mp3",
  "10.mp3",
  "11.mp3",
];


// Variable
var intValue = Random().nextInt(10);

String fontName = 'f1';
String? select = CategoriesImageList['ToughTimes']?[intValue]['text'].toString();
bool isDark = false;
bool isAuthor = true;
bool isCategory = false;
bool isRandom=true;


// Learn By YouTube


