<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "Trivia".
 *
 * @property integer $id
 * @property string $question
 * @property string $answer
 * @property integer $profile_id
 */
class Trivia extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'Trivia';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['question', 'answer', 'profile_id'], 'required'],
            [['profile_id'], 'integer'],
            [['question', 'answer'], 'string', 'max' => 100],
            [['profile_id'], 'exist', 'skipOnError' => true, 'targetClass' => Profile::className(), 'targetAttribute' => ['profile_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'question' => 'Question',
            'answer' => 'Answer',
            'profile_id' => 'Profile ID',
        ];
    }
}
